class Answer < ApplicationRecord
  belongs_to :interview_question

  def feedback
    client = OpenAI::Client.new
    # pass parameters and prompts to Chat GPT
    chaptgpt_answer_feedback = client.chat(parameters: {
      model: "gpt-3.5-turbo",
      messages: [{ role: "user", content: "Provide me a small feedback on the asked question: #{interview_question.question.content}. Take the user's answer into account: #{content}.
      Give me an answer feedback not a feedback for the quesion.
      Omit motivational phrases like 'good job' or 'you can do better'.
      Return it in a feedback format and address the user directly.
      Structure the feedback in a way that is constructive and actionable.
      Do not include any of your own answers like 'Here is a feedback.
      Give me rating from 1-10 for the answer at the very end."}]
    })
    # Save Chat GPT answer into answer_feedback variable
    answer_feedback = chaptgpt_answer_feedback["choices"][0]["message"]["content"]
    # Update the question_answer array to be pushed in bulk to chat GPT for the final feedback
    update(answer_feedback: answer_feedback)
  end
end
