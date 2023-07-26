# Enter maintenance mode or return true
# if already is in maintenance mode
(php artisan down) || true

# Pull the latest version of the app
#git fetch
#git stash
#git pull --rebase origin master
echo dev
pushd /var/web/html_new/hospitalMS
sudo git checkout .
sudo git pull myfork main
sudo composer install 
sudo chmod -R 777 storage
sudo chmod -R 777 bootstrap/cache
popd
#sudo chown -Rf nginx.nginx /var/web/html_new/hospitalMS
sudo chown -Rf nginx:webtest /var/web/html_new/hospitalMS
sudo chmod -Rf 770 /var/web/html_new/hospitalMS
sudo chmod -Rf g+s /var/web/html_new/hospitalMS
sudo systemctl reload php-fpm.service
sudo nginx -s reload

# Install composer dependencies
#composer install --no-dev --no-interaction --prefer-dist --optimize-autoloader

# Clear the old cache
php artisan clear-compiled
php artisan config:cache

# Recreate cache
#php artisan optimize

# Compile npm assets
#npm run prod

# Run database migrations
#php artisan migrate --force

# Exit maintenance mode
php artisan up
echo "Application deployed!"
