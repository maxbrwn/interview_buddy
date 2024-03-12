require "openai"

class AudioController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:generate_speech]

  def generate_speech
    begin
      client = OpenAI::Client.new(api_key: ENV['OPENAI_API_KEY'])
      text = JSON.parse(request.body.read)['text']

      response = client.audio.speech(
        parameters: {
          model: "tts-1",
          input: text,
          voice: "alloy"
        }
      )

      speech_file_path = Rails.root.join('public', 'speech.mp3')
      File.binwrite(speech_file_path, response)

      SpeechLog.create(user: current_user, text: text, generated_at: Time.now)

      send_file speech_file_path
    rescue => e
      logger.error("Error generating speech: #{e.message}")
      render json: { error: e.message }, status: :internal_server_error
    end
  end
end
