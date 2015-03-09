class Agent
  require 'rest-client'
  require 'json'

  def run
    loop do
      process
      puts "Sleeping 15 seconds"
      sleep 15
    end
  end

  private

  def process
  end

  def queue
    checkin.fetch("downloads")
  end

  def checkin
    JSON.parse(RestClient.put(checkin_url, {}))
  end

  def checkin_url
    agent_id = 1
    endpoint + "/agents/#{agent_id}/checkin"
  end

  def endpoint
    "http://localhost:3000/"
  end
end
