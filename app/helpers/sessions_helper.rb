module SessionsHelper
  
  def post
    client = Twitter::Client.new
    begin
      client.update(params[:text])
      return true
    rescue Exception => e
       flash[:notice] = "Failed"
      return false
    end
  end
  
end
