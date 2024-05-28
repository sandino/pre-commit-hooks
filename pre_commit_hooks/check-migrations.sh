#!/usr/bin/env sh

RETURN=0

main() {
    check_migrations
}

check_migrations() {
    # Check if there any changes in Django project that require database migrations.

    python manage.py makemigrations --check

    RETURN=$?

    if [ $RETURN -eq 0  ];
    then
        echo "No changes found."
        exit 0
    else
        echo "Some changes require migrations. Run 'python manage.py makemigrations' and then 'migrate'."
        exit $RETURN
    fi
}

main
exit ${RETURN}
