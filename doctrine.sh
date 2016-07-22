#!/bin/sh
doctrine-migrations --configuration=/config/migrations.yml --db-configuration=/config/db.php $*
