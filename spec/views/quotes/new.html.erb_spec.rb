require 'rails_helper'

RSpec.describe 'quotes/new', type: :view do
  before(:each) do
    assign(:quote, Quote.new)
  end

  it 'renders new quote form' do
    render

    assert_select 'form[action=?][method=?]', quotes_path, 'post' do
    end
  end
end
