Given('I am on the homepage') do
  visit('https://magento.softwaretestingboard.com/')
end

When('I click Sign In') do
  click_on "Sign In"
  expect(find('span.base').text).to eql("Customer Login")
end

When('I fill my credential') do
  # jika fill ada 2 yang ambigu/sama menggunakan id/name yang sama menggunakan ini :
  # find('#email').set('0072andhikap@gmail.com')
  fill_in 'email', with: '0072andhikap@gmail.com'
  fill_in 'login[password]', with: 'S@ngperusuh123'
  find('#send2').click
end

Then('I should be logged in') do
  expect(find('h1.page-title').text).to eql("Home Page")
end

When('I fill wrong email') do
  # jika fill ada 2 yang ambigu/sama menggunakan id/name yang sama menggunakan ini :
  # find('#email').set('0072andhikap@gmail.com')
  fill_in 'email', with: '00723andhikap@gmail.com'
  fill_in 'login[password]', with: 'S@ngperusuh123'
  find('#send2').click
end

Then('I should be not logged in') do
  expect(find('span.base').text).to eql("Customer Login")
end

And ('I should see the error message') do
  expect(find('div.message-error').text).to eql("The account sign-in was incorrect or your account is disabled temporarily. Please wait and try again later.")
end
