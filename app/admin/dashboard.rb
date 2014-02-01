ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Proposals" do
          h3 do
            "Total Proposals: #{Proposal.count}"
          end
        end
      end
      column do
        panel "Users" do
          h3 do
            "Total Users: #{User.count}"
          end
        end
      end
    end
  end
end
