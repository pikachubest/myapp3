# Використання офіційного PHP образу
FROM php:8.1-apache

# Копіюємо файли додатку до контейнера
COPY . /var/www/html/

# Налаштування прав
RUN chown -R www-data:www-data /var/www/html

# Встановлюємо розширення для MySQL
RUN docker-php-ext-install mysqli
