require 'eric_tools'
describe "get_city_name_from_ip" do
  it 'should be shanghai' do
    response = EricTools.get_city_name_from_ip :ak => 'HS8ViRxQT0xMu8d3uARISMif', :ip => '101.231.116.38'
    response["city"].equal? '上海'
  end
end