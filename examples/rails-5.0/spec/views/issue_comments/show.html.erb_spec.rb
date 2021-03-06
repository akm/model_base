# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'issue_comments/show', type: :view do
  let(:user) { FactoryBot.create(:user) }
  let(:project) { FactoryBot.create(:project, owner: user) }
  let(:issue) { FactoryBot.create(:issue, project: project, creator: user) }
  let(:issue_comment) { FactoryBot.create(:issue_comment, issue: issue, user: user) }
  before(:each) do
    assign(:issue_comment, issue_comment)
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/issue1/)
    expect(rendered).to match(/user1@example.com/)
    expect(rendered).to match(/issue_comment_description_1/)
  end
end
