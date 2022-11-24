module UserInput
  def ask_for_user_inputs(*messages)
    user_inputs = []
    messages.each do |message|
      puts message
      user_inputs << gets.chomp
    end
    user_inputs
  end
end
