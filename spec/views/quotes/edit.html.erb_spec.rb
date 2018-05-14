require 'rails_helper'

RSpec.describe 'quotes/edit', type: :view do
  before(:each) do
    @quote = assign(:quote, create(:quote))
  end

  it 'renders the edit quote form' do
    render

    assert_select 'form[action=?][method=?]', quote_path(@quote), 'post' do
      assert_select 'textarea#quote_text'
      assert_select 'input[type=text]#quote_source'
    end
  end
end
