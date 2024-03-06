class Answer < ApplicationRecord
  belongs_to :interview_question

  def feedback
    client = OpenAI::Client.new
    # pass parameters and prompts to Chat GPT
    chaptgpt_answer_feedback = client.chat(parameters: {
      model: "gpt-3.5-turbo",
      messages: [{ role: "user", content: "Provide me a small answer feedback on the asked question: #{answer.interview_question.question.content}. Take the user's answer into account: #{answer.content}.
      Take the following parameters into account:
      1.Does the answer solve the problem or address the question correctly?
      2.Are variable and function names meaningful?
      3.How well does the interviewee break down the problem?
      4.Does the interviewee articulate their thought process clearly?
      Provide your feedback, without any of your own answers like 'Here is a simple recipe'."}]
    })
    # Save Chat GPT answer into answer_feedback variable
    answer_feedback = chaptgpt_answer_feedback["choices"][0]["message"]["content"]
    # Update the question_answer array to be pushed in bulk to chat GPT for the final feedback
    update(answer_feedback: answer_feedback)
  end

  # def overall_feedback
  #   client = OpenAI::Client.new
  #   chaptgpt_general_feedback = client.chat(parameters: {
  #     model: "gpt-3.5-turbo",
  #     messages: [{ role: "user", content: "Provide an overall feedback on all asked questions #{INTERPOLATION_GOES_HERE}. Structure the feedback as follows:
  #     1.Positive Feedback:
  #     Start with positive aspects of the response to encourage the interviewee.
  #     Acknowledge any strengths in their approach or code.
  #     2.Constructive Criticism:
  #     Highlight specific areas for improvement, such as correctness, efficiency, or clarity.
  #     Provide suggestions on how to enhance the solution.
  #     3. Provide the correct answer to the question adding the upfront disclaimer "The detailed answer would be the following.
  #     However just take this into account for further learning purposes. It's obvious that it's impossible to answer in such a detailled format during a real interview."
  #     3. Next steps:
  #     Let the user know that it's possible to bookmark certain questions to take them into account for further
  #     practice. Further it's possible to checkout all questions, their answers as well as the overall feedback on the profile page"}]
  #   })
  #   return chaptgpt_general_feedback["choices"][0]["message"]["content"]
  # end

end
