Demo app to reproduce matthuhiggins/foreigner#110

### Steps to reproduce the issue: 

```
rake db:create
rake db:migrate VERSION=20140427204421
rake db:migrate VERSION=20140427204421 RAILS_ENV=test
rake db:migrate

# In This moment any of following fails:
rake spec

rake db:schema:load
```

Error stack:
```
$ rake spec   
/usr/local/rvm/rubies/ruby-2.1.1/bin/ruby -S rspec ./spec/models/child_spec.rb ./spec/models/parent_spec.rb
/usr/local/rvm/gems/ruby-2.1.1/gems/activerecord-4.1.0/lib/active_record/connection_adapters/postgresql/database_statements.rb:128:in `async_exec': PG::DependentObjectsStillExist: ERROR:  cannot drop table children because other objects depend on it (ActiveRecord::StatementInvalid)
DETAIL:  constraint parents_best_child_id_fk on table parents depends on table children
HINT:  Use DROP ... CASCADE to drop the dependent objects too.
: DROP TABLE "children"
	from /usr/local/rvm/gems/ruby-2.1.1/gems/activerecord-4.1.0/lib/active_record/connection_adapters/postgresql/database_statements.rb:128:in `block in execute'
	from /usr/local/rvm/gems/ruby-2.1.1/gems/activerecord-4.1.0/lib/active_record/connection_adapters/abstract_adapter.rb:373:in `block in log'
	from /usr/local/rvm/gems/ruby-2.1.1/gems/activesupport-4.1.0/lib/active_support/notifications/instrumenter.rb:20:in `instrument'
	from /usr/local/rvm/gems/ruby-2.1.1/gems/activerecord-4.1.0/lib/active_record/connection_adapters/abstract_adapter.rb:367:in `log'
	from /usr/local/rvm/gems/ruby-2.1.1/gems/activerecord-4.1.0/lib/active_record/connection_adapters/postgresql/database_statements.rb:127:in `execute'
	from /usr/local/rvm/gems/ruby-2.1.1/gems/activerecord-4.1.0/lib/active_record/connection_adapters/abstract/schema_statements.rb:367:in `drop_table'
	from /usr/local/rvm/gems/ruby-2.1.1/gems/foreigner-1.6.1/lib/foreigner/connection_adapters/sql2003.rb:11:in `block in drop_table'
	from /usr/local/rvm/gems/ruby-2.1.1/gems/activerecord-4.1.0/lib/active_record/connection_adapters/postgresql/referential_integrity.rb:17:in `disable_referential_integrity'
	from /usr/local/rvm/gems/ruby-2.1.1/gems/foreigner-1.6.1/lib/foreigner/connection_adapters/sql2003.rb:11:in `drop_table'
	from /usr/local/rvm/gems/ruby-2.1.1/gems/activerecord-4.1.0/lib/active_record/connection_adapters/abstract/schema_statements.rb:202:in `create_table'
	from /usr/local/rvm/gems/ruby-2.1.1/gems/foreigner-1.6.1/lib/foreigner/connection_adapters/abstract/schema_statements.rb:14:in `create_table'
	from /usr/local/rvm/gems/ruby-2.1.1/gems/activerecord-4.1.0/lib/active_record/migration.rb:649:in `block in method_missing'
	from /usr/local/rvm/gems/ruby-2.1.1/gems/activerecord-4.1.0/lib/active_record/migration.rb:621:in `block in say_with_time'
	from /usr/local/rvm/rubies/ruby-2.1.1/lib/ruby/2.1.0/benchmark.rb:279:in `measure'
	from /usr/local/rvm/gems/ruby-2.1.1/gems/activerecord-4.1.0/lib/active_record/migration.rb:621:in `say_with_time'
	from /usr/local/rvm/gems/ruby-2.1.1/gems/activerecord-4.1.0/lib/active_record/migration.rb:641:in `method_missing'
	from /foreignkeysdemo/db/schema.rb:19:in `block in <top (required)>'
	from /usr/local/rvm/gems/ruby-2.1.1/gems/activerecord-4.1.0/lib/active_record/schema.rb:42:in `instance_eval'
	from /usr/local/rvm/gems/ruby-2.1.1/gems/activerecord-4.1.0/lib/active_record/schema.rb:42:in `define'
	from /usr/local/rvm/gems/ruby-2.1.1/gems/activerecord-4.1.0/lib/active_record/schema.rb:62:in `define'
	from /foreignkeysdemo/db/schema.rb:14:in `<top (required)>'
	from /usr/local/rvm/gems/ruby-2.1.1/gems/activesupport-4.1.0/lib/active_support/dependencies.rb:241:in `load'
	from /usr/local/rvm/gems/ruby-2.1.1/gems/activesupport-4.1.0/lib/active_support/dependencies.rb:241:in `block in load'
	from /usr/local/rvm/gems/ruby-2.1.1/gems/activesupport-4.1.0/lib/active_support/dependencies.rb:232:in `load_dependency'
	from /usr/local/rvm/gems/ruby-2.1.1/gems/activesupport-4.1.0/lib/active_support/dependencies.rb:241:in `load'
	from /usr/local/rvm/gems/ruby-2.1.1/gems/activerecord-4.1.0/lib/active_record/tasks/database_tasks.rb:164:in `load_schema'
	from /usr/local/rvm/gems/ruby-2.1.1/gems/activerecord-4.1.0/lib/active_record/migration.rb:394:in `load_schema_if_pending!'
	from /usr/local/rvm/gems/ruby-2.1.1/gems/activerecord-4.1.0/lib/active_record/migration.rb:401:in `block in maintain_test_schema!'
	from /usr/local/rvm/gems/ruby-2.1.1/gems/activerecord-4.1.0/lib/active_record/migration.rb:629:in `suppress_messages'
	from /usr/local/rvm/gems/ruby-2.1.1/gems/activerecord-4.1.0/lib/active_record/migration.rb:406:in `method_missing'
	from /usr/local/rvm/gems/ruby-2.1.1/gems/activerecord-4.1.0/lib/active_record/migration.rb:401:in `maintain_test_schema!'
	from /foreignkeysdemo/spec/spec_helper.rb:17:in `<top (required)>'
	from /foreignkeysdemo/spec/models/child_spec.rb:1:in `require'
	from /foreignkeysdemo/spec/models/child_spec.rb:1:in `<top (required)>'
	from /usr/local/rvm/gems/ruby-2.1.1/gems/rspec-core-3.0.0.beta2/lib/rspec/core/configuration.rb:932:in `load'
	from /usr/local/rvm/gems/ruby-2.1.1/gems/rspec-core-3.0.0.beta2/lib/rspec/core/configuration.rb:932:in `block in load_spec_files'
	from /usr/local/rvm/gems/ruby-2.1.1/gems/rspec-core-3.0.0.beta2/lib/rspec/core/configuration.rb:932:in `each'
	from /usr/local/rvm/gems/ruby-2.1.1/gems/rspec-core-3.0.0.beta2/lib/rspec/core/configuration.rb:932:in `load_spec_files'
	from /usr/local/rvm/gems/ruby-2.1.1/gems/rspec-core-3.0.0.beta2/lib/rspec/core/command_line.rb:21:in `run'
	from /usr/local/rvm/gems/ruby-2.1.1/gems/rspec-core-3.0.0.beta2/lib/rspec/core/runner.rb:100:in `run'
	from /usr/local/rvm/gems/ruby-2.1.1/gems/rspec-core-3.0.0.beta2/lib/rspec/core/runner.rb:31:in `invoke'
	from /usr/local/rvm/gems/ruby-2.1.1/gems/rspec-core-3.0.0.beta2/exe/rspec:4:in `<top (required)>'
	from /usr/local/rvm/gems/ruby-2.1.1/bin/rspec:23:in `load'
	from /usr/local/rvm/gems/ruby-2.1.1/bin/rspec:23:in `<main>'
/usr/local/rvm/rubies/ruby-2.1.1/bin/ruby -S rspec ./spec/models/child_spec.rb ./spec/models/parent_spec.rb failed
```

