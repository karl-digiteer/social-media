class ChangeDefaults < ActiveRecord::Migration[8.0]
  def change
    change_column_null :posts, :featured, false
    change_column_default :posts, :featured, false
    change_column_null :posts, :active, false
    change_column_default :posts, :active, true
  end
end
