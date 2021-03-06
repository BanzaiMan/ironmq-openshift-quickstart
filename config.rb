def get_client
  ### Set these to your IronMQ credentials ###
  config = {
    token: 'put_token_here',
    project_id: 'put_project_id_here'
  }
  @ironmq ||= IronMQ::Client.new(token: config[:token], project_id: config[:project_id])
end

def get_queue
  begin
    ironmq = get_client
  rescue
    erb :index
    return
  end
  @queue = ironmq.queue("open_shift_queue")
end
