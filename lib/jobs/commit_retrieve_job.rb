class CommitRetrieveJob
	@queue = :deployment

  def self.perform(user_id, commit_hash)
    puts "#{user_id}, #{commit_hash}"
  end
end