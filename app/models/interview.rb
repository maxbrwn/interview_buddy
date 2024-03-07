class Interview < ApplicationRecord
  belongs_to :user
  has_many :interview_questions, dependent: :destroy
  has_many :questions, through: :interview_questions
  has_many :answers, through: :interview_questions


  def overall_feedback
    @all_questions = questions.pluck(:content)
    @all_answers = answers.pluck(:content)
    @question_answer_hash = {}
    @all_questions.each_with_index do |question, index|
      @question_answer_hash[question] = @all_answers[index]
    end
    number = 1
    @interview_string = ""
    @question_answer_hash.each do |question, answer|
      @interview_string << "#{number}. Interviewer: #{question}\nInterviewee: #{answer}\n"
      number += 1
    end
    @all_feedback = answers.pluck(:answer_feedback)

    client = OpenAI::Client.new
    chaptgpt_general_feedback = client.chat(parameters: {
      model: "gpt-3.5-turbo",
      messages: [{ role: "user", content: "give me a summary about this interview. can you give me a rating from 1-10 for each answer and over all. be honest and realistic for the summary and the rating. give some hints on how to improve. #{@interview_string}. One answer after another. Return it in a feedback format and address the user directly. Give me back a JSON format with the following structure: {\"feedback\": \"Your feedback per answer\"}"}]
    })
    final_feedback = chaptgpt_general_feedback["choices"][0]["message"]["content"]
    update(feedback: final_feedback)
  end
end
