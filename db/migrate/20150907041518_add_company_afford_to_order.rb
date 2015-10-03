class AddCompanyAffordToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :company_afford, :boolean
  end
end
