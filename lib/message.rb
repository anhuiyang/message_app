class Message
attr_reader :msg, :time, :id

  def initialize(msg)
    @msg = msg
    @time = Time.now
    @id = Time.now.to_i
  end

  def title
    msg[0,20]
  end
end
