dnf install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-9-x86_64/pgdg-redhat-repo-latest.noarch.rpm
dnf -qy module disable postgresql
dnf install -y postgresql16-server postgresql16
postgresql-setup --initdb

sed -i "s/^#listen_addresses =.*/listen_addresses = '*'/" /var/lib/pgsql/data/postgresql.conf

cp pg_hba.conf /var/lib/pgsql/data/pg_hba.conf 

systemctl restart postgresql

sudo -u postgres /usr/bin/psql -f /path/to/schema.sql