When("I sleep") do
  sleep 10
end

When("I do nothing") do
end

Then("I pass") do
  expect(true).to be_truthy
end