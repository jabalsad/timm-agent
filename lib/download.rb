class Download
  include Aria

  attr_reader :uri
  attr_reader :output
  attr_reader :size
  attr_reader :downloaded
  attr_reader :speed
  attr_reader :status
  attr_reader :gid

  def initialize(params)
    @uri = params.fetch(:uri)
    @output = params.fetch(:output)
    @size = params.fetch(:size)
    @downloaded = params.fetch(:downloaded)
    @speed = params.fetch(:speed)
    @status = params.fetch(:status)
    @gid = params.fetch(:gid)
  end

  def self.from_aria(hash)
    file = hash["files"].first
    uri = file["uris"].first
    params = {
      uri: uri,
      output: file["path"],
      size: file["length"],
      downloaded: file["completedLength"],
      speed: hash["downloadSpeed"],
      status: hash["status"],
      gid: hash["gid"],
    }
    new(params)
  end

  def pause!
    aria.pause(gid)
  end

  def unpause!
    aria.unpause(gid)
  end

  def active?
    status == "active"
  end

  def paused?
    status == "paused"
  end

  def stopped?
    status == "stopped"
  end

end
