module PollsHelper
# classes from bootstrap and tutorial from sitepoint, displays numbers of votes for each option in a poll
  def visualize_votes_for(option)
    content_tag :div, class: 'progress' do
      content_tag :div, class: 'progress-bar',
                  style: "width: #{option.poll.normalized_votes_for(option)}%" do
        "#{option.votes.count}"
      end
    end
  end
end