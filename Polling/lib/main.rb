class Main
  def login(username)
    @user = User.find_by_username(username)
  end

  def make_poll(title)
    @user.make_poll(title)
  end

  def take_poll(poll_id)
    poll = Poll.find(poll_id)
    questions_array = @user.take_poll(poll)
    questions_array.each { |q| ask_question(q) }
  end

  # def ask_question(array)
  #   puts array.first
  #   array[1..-1].each_with_index do |choice,i|
  #     puts "Choice #{i}: #{choice}"
  #   end
  #   input = gets.chomp.first.to_i
  #
  # end

  def poll_list(author_name = nil)
    author = User.find_by_username(author_name)
    if author_name && author.nil?
      raise "User doesn't exist."
    end

    if author_name.nil?
      Poll.all.each{|poll| puts "#{poll.id}: #{poll.title}"}
    else
      author.polls.each{|poll| puts "#{poll.id}: #{poll.title}"}
    end

  end




end