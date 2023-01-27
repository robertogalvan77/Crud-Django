#!bin/bash
PROD=${PRODUCTION:-false}
NAME=${APP:-costumer}
if [ $# -eq 0 ]
then
	echo -e "\nIniciando servidor..."
	python $NAME/manage.py runserver
        exit 0
fi

while [ $# -gt 0 ] ; do
    case $1 in
	-i | --install)
	    echo -e "\nInstalando requerimientos..."
	    pip install -r requirements/base.txt
	    exit 0
	    ;;

	-c | --cleandb)
	    echo -e "\nInstalando requerimientos...";
		if [[ $PROD == false ]] ; then
	    	pip install -r requirements/base.txt
		else
			cd /
		fi;
	    echo -e "\nLimpiando Base de Datos... "
	    cd $NAME
	    echo -e "\nBorrando DB sqlite... ";

		if [[ $DELETE_DB == true ]] || [[ $PROD == false ]] ; then
  			rm db.sqlite3
  			rm -rf */__pycache__

  			if [[ $PROD == 0 ]] || [[ $PROD == 1 ]]; then
				# Por si es necesario borrar las migraciones:
				find . -type f -path '*migrations*/*' -name '*.py' \
					! -name '__init__.py' -delete
				find . -type f -path '*migrations*/*' -name '*.pyc' -delete

    			python drop_db.py;
  			fi;
		fi;

	    echo -e "\nAplicando migraciones al ORM..."

	    ./manage.py check
	    ./manage.py makemigrations
	    ./manage.py migrate
	    # echo -e "\nCargando usuarios...."
		# ./manage.py loaddata user_settings.json
	    # ./manage.py loaddata users.json
	    # echo -e "\nCargando Admin-Site...."
		# ./manage.py loaddata admin_interface_theme_nano.json
		# echo -e "\nCargando Organizacion..."
		# ./manage.py loaddata fixgeneral.json
		# echo -e "\nCargando Empresa..."
		# ./manage.py loaddata empresa.json
		# echo -e "\nCargando Servicios..."
		# ./manage.py loaddata servicios.json
		# echo -e "\nCargando Miembros..."
		# ./manage.py loaddata miembros.json

	    exit 0
	    ;;
	-t | --test)
	    echo -e "\nTesting... "
	    cd $NAME
	    python manage.py test
	    exit 0
	    ;;
    esac
    shift
done