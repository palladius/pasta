
On 2019-04-14 script/server wouldn't start due to this error:

    /root/.rbenv/versions/1.8.7-p375/lib/ruby/gems/1.8/gems/rails-2.3.18/lib/rails/rack/log_tailer.rb:10:in `size': No such file or directory - /var/www/pasta/log/development.log (Errno::ENOENT)

After creating log/ *AND* touching the development.log file it would start. 