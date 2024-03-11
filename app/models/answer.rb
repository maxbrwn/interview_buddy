class Answer < ApplicationRecord
  belongs_to :interview_question
  validates_uniqueness_of :interview_question_id


  def feedback
    client = OpenAI::Client.new
    # pass parameters and prompts to Chat GPT
    chaptgpt_answer_feedback = client.chat(parameters: {
      model: "gpt-3.5-turbo",
      messages: [{ role: "user", content: "Provide me a small answer feedback on the asked question: #{interview_question.question.content}. Take the user's answer into account: #{content}.
      Take the following parameters into account:
      1.Does the answer solve the problem or address the question correctly?
      2.Are variable and function names meaningful?
      3.How well does the interviewee break down the problem?
      4.Does the interviewee articulate their thought process clearly?
      Provide your feedback, without any of your own answers like 'Here is a simple recipe'."}]
    })
    # Save Chat GPT answer into answer_feedback variable
    # answer_feedback = chaptgpt_answer_feedback["choices"][0]["message"]["content"]

    # Update the question_answer array to be pushed in bulk to chat GPT for the final feedback
    update(answer_feedback: answer_feedback)
  end
end
