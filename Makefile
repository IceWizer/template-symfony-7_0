SHELL := /bin/bash

tests:
	php bin/console doctrine:database:drop --force --env=test || true
	php bin/console doctrine:database:create --env=test
	php bin/console doctrine:migrations:migrate -n --env=test
	php bin/console doctrine:fixtures:load -n --env=test --group=test
	php bin/phpunit --coverage-html public/test-report
.PHONY: tests