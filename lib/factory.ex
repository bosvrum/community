defmodule Community.Factory do
  use ExMachina.Ecto, repo: Community.Repo

  def factory(:job) do
    %Community.Job{
      approved: false,
      city: "Raleigh",
      contact: sequence(:contact, &"contact-#{&1}@example.com"),
      company: "thoughtbot",
      company_url: "http://www.example.com",
      description: "A great job",
      instructions: "SIGN UP NOW!",
      preview: true,
      title: "title",
    }
  end

  def factory(:member) do
    %Community.Member{
      approved: false,
      title: "designer at thoughtbot",
      email: sequence(:email, &"email-#{&1}@example.com"),
      name: "Ralph Robot",
      website: "http://ralph.thoughtbot.com",
    }
  end

  def approve(job) do
    %{job | approved: true}
  end
end
