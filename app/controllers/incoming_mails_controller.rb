class IncomingMailsController < ApplicationController
  def create
    Rails.logger.info params
    message = Message.new(
      :to => params[:envelope][:to],
      :from => params[:envelope][:from],
      :subject => params[:headers]['Subject'],
      :body => params[:plain]
    )
    if message.save
      render :text => 'Success', :status => 200
    else
      render :text => message.errors.full_messages, :status => 422, :content_type => Mime::TEXT.to_s
    end
  end
end

#=> {"plain"=>"Test with HTML.", "html"=>"<html><head>\r\n<meta http-equiv=\"content-type\" content=\"text/html; charset=ISO-8859-1\"></head><body\r\n bgcolor=\"#FFFFFF\" text=\"#000000\">\r\nTest with <span style=\"font-weight: bold;\">HTML</span>.<br>\r\n</body>\r\n</html>", "reply_plain"=>"Message reply if found.", "headers"=>{"Return-Path"=>"from@example.com", "Received"=>{"0"=>"by 10.52.90.229 with SMTP id bz5cs75582vdb; Mon, 16 Jan 2012 09:00:07 -0800", "1"=>"by 10.216.131.153 with SMTP id m25mr5479776wei.9.1326733205283; Mon, 16 Jan 2012 09:00:05 -0800", "2"=>"from mail-wi0-f170.google.com (mail-wi0-f170.google.com [209.85.212.170]) by mx.google.com with ESMTPS id u74si9614172weq.62.2012.01.16.09.00.04 (version=TLSv1/SSLv3 cipher=OTHER); Mon, 16 Jan 2012 09:00:04 -0800"}, "Date"=>"Mon, 16 Jan 2012 17:00:01 +0000", "From"=>"Message Sender <sender@example.com>", "To"=>"Message Recipient <to@example.com>", "Message-ID"=>"<4F145791.8040802@example.com>", "Subject"=>"Test Subject", "Mime-Version"=>"1.0", "Delivered-To"=>"to@example.com", "Received-SPF"=>"neutral (google.com: 10.0.10.1 is neither permitted nor denied by best guess record for domain of from@example.com) client-ip=10.0.10.1;", "Authentication-Results"=>"mx.google.com; spf=neutral (google.com: 10.0.10.1 is neither permitted nor denied by best guess record for domain of from@example.com) smtp.mail=from@example.com", "User-Agent"=>"Postbox 3.0.2 (Macintosh/20111203)"}, "envelope"=>{"to"=>"to@example.com", "recipients"=>{"0"=>"to@example.com"}, "from"=>"from@example.com", "helo_domain"=>"localhost", "remote_ip"=>"127.0.0.1", "spf"=>{"result"=>"pass", "domain"=>"example.com"}}, "attachments"=>{"0"=>#<ActionDispatch::Http::UploadedFile:0x007f9bef0aed98 @original_filename="file1.txt", @content_type="text/plain", @headers="Content-Disposition: form-data; name=\"attachments[0]\"; filename=\"file1.txt\"\r\nContent-Type: text/plain\r\n", @tempfile=#<Tempfile:/var/folders/sq/lggbm81j6zdgp8xz9c69wwr80000gn/T/RackMultipart20130409-6298-120trfe>>, "1"=>#<ActionDispatch::Http::UploadedFile:0x007f9bef0aecd0 @original_filename="file2.txt", @content_type="text/plain", @headers="Content-Disposition: form-data; name=\"attachments[1]\"; filename=\"file2.txt\"\r\nContent-Type: text/plain\r\n", @tempfile=#<Tempfile:/var/folders/sq/lggbm81j6zdgp8xz9c69wwr80000gn/T/RackMultipart20130409-6298-hbuu4r>>}}