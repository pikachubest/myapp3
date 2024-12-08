-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Хост: localhost:3306
-- Время создания: Ноя 27 2024 г., 22:09
-- Версия сервера: 5.7.24
-- Версия PHP: 8.3.1


BEGIN;
SET time_zone = "+00:00";







--
-- База данных: "lab3(3)"
--

-- --------------------------------------------------------

--
-- Структура таблицы "categories"
--

CREATE TABLE "categories" (
  "id" int(11) NOT NULL,
  "parentId" int(11) DEFAULT NULL,
  "name" varchar(255) NOT NULL
)  DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы "categories"
--

INSERT INTO "categories" ("id", "parentId", "name") VALUES
(1, NULL, 'Комп\'ютери та ноутбуки'),
(2, 1, 'Ноутбуки'),
(3, 1, 'Комп\'ютери'),
(4, NULL, 'Побутова техніка'),
(5, 4, 'Холодильники');

-- --------------------------------------------------------

--
-- Структура таблицы "deliveries"
--

CREATE TABLE "deliveries" (
  "id" int(11) NOT NULL,
  "type" varchar(50) DEFAULT NULL,
  "carrier" varchar(50) DEFAULT NULL,
  "cost" decimal(10,2) DEFAULT NULL,
  "freeFrom" decimal(10,2) DEFAULT NULL,
  "city" varchar(100) DEFAULT NULL
)  DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы "deliveries"
--

INSERT INTO "deliveries" ("id", "type", "carrier", "cost", "freeFrom", "city") VALUES
(6, 'address', 'Нова Пошта', '50.00', '1000.00', 'Київ'),
(7, 'warehouse', 'Укрпошта', '40.00', '500.00', 'Львів'),
(8, 'pickup', NULL, '0.00', NULL, NULL),
(9, 'warehouse', 'Meest', '30.00', NULL, 'Одеса'),
(10, 'address', 'DHL', '100.00', '2000.00', 'Харків');

-- --------------------------------------------------------

--
-- Структура таблицы "products"
--

CREATE TABLE "products" (
  "id" int(11) NOT NULL,
  "categoryId" int(11) DEFAULT NULL,
  "code" varchar(50) DEFAULT NULL,
  "barcode" varchar(50) DEFAULT NULL,
  "vendor" varchar(100) DEFAULT NULL,
  "name" varchar(255) NOT NULL,
  "description" text,
  "url" varchar(255) DEFAULT NULL,
  "image" varchar(255) DEFAULT NULL,
  "priceRUAH" decimal(10,2) DEFAULT NULL,
  "priceRUSD" decimal(10,2) DEFAULT NULL,
  "stock" varchar(50) DEFAULT NULL,
  "deliveryId" int(11) DEFAULT NULL,
  "guarantee_type" varchar(50) DEFAULT NULL,
  "guarantee_period" int(11) DEFAULT NULL
)  DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы "products"
--

INSERT INTO "products" ("id", "categoryId", "code", "barcode", "vendor", "name", "description", "url", "image", "priceRUAH", "priceRUSD", "stock", "deliveryId", "guarantee_type", "guarantee_period") VALUES
(101, 2, 'NB001', '1234567890123', 'Dell', 'Dell Inspiron 15', 'Ноутбук з процесором Intel i5', NULL, NULL, '25000.00', '700.00', 'В наявності', NULL, 'Рік', 12),
(102, 2, 'NB002', '1234567890124', 'HP', 'HP Pavilion 14', 'Ноутбук з процесором AMD Ryzen 5', NULL, NULL, '23000.00', '650.00', 'Під замовлення', NULL, 'Рік', 12),
(103, 3, 'PC001', '1234567890125', 'Lenovo', 'Lenovo ThinkCentre', 'Стаціонарний комп\'ютер для офісу', NULL, NULL, '18000.00', '500.00', 'В наявності', NULL, 'Місяць', 6),
(104, 5, 'FR001', '1234567890126', 'Samsung', 'Samsung RB33J', 'Холодильник з технологією No Frost', NULL, NULL, '15000.00', '400.00', 'В наявності', NULL, 'Рік', 24),
(105, 5, 'FR002', '1234567890127', 'LG', 'LG DoorCooling+', 'Енергозберігаючий холодильник', NULL, NULL, '16000.00', '450.00', 'Під замовлення', NULL, 'Рік', 24);

-- --------------------------------------------------------

--
-- Структура таблицы "settings"
--

CREATE TABLE "settings" (
  "id" int(11) NOT NULL,
  "firmName" varchar(255) DEFAULT NULL,
  "firmId" int(11) DEFAULT NULL,
  "rate" decimal(10,2) DEFAULT NULL,
  "date" datetime DEFAULT NULL
)  DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы "settings"
--

INSERT INTO "settings" ("id", "firmName", "firmId", "rate", "date") VALUES
(1, 'Shop.ua', 12345, '39.20', '2024-11-27 19:34:17'),
(2, 'TechStore', 54321, '38.80', '2024-11-27 19:34:17'),
(3, 'GadgetWorld', 67890, '39.50', '2024-11-27 19:34:17'),
(4, 'HomeElectro', 98765, '38.00', '2024-11-27 19:34:17'),
(5, 'MegaShop', 11223, '39.00', '2024-11-27 19:34:17');

-- --------------------------------------------------------

--
-- Структура таблицы "stores"
--

CREATE TABLE "stores" (
  "id" int(11) NOT NULL,
  "name" varchar(255) DEFAULT NULL,
  "address" varchar(255) DEFAULT NULL,
  "workdays_from" time DEFAULT NULL,
  "workdays_to" time DEFAULT NULL,
  "sat_from" time DEFAULT NULL,
  "sat_to" time DEFAULT NULL,
  "sun_from" time DEFAULT NULL,
  "sun_to" time DEFAULT NULL,
  "tel" varchar(20) DEFAULT NULL
)  DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы "stores"
--

INSERT INTO "stores" ("id", "name", "address", "workdays_from", "workdays_to", "sat_from", "sat_to", "sun_from", "sun_to", "tel") VALUES
(1, 'Магазин на Подолі', 'Київ, вул. Хорива, 10', '09:00:00', '21:00:00', '10:00:00', '18:00:00', '10:00:00', '18:00:00', '+380931234567'),
(2, 'Магазин у центрі', 'Львів, пр. Свободи, 15', '09:00:00', '20:00:00', '10:00:00', '18:00:00', NULL, NULL, '+380932345678'),
(3, 'Салон у Харкові', 'Харків, вул. Сумська, 30', '08:00:00', '19:00:00', '09:00:00', '17:00:00', NULL, NULL, '+380933456789'),
(4, 'Склад в Одесі', 'Одеса, вул. Дерибасівська, 5', '10:00:00', '18:00:00', '11:00:00', '15:00:00', NULL, NULL, '+380934567890'),
(5, 'Філія у Дніпрі', 'Дніпро, вул. Карла Маркса, 25', '08:30:00', '20:30:00', '09:00:00', '18:00:00', '10:00:00', '14:00:00', '+380935678901');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы "categories"
--
ALTER TABLE "categories"
  ADD PRIMARY KEY ("id");

--
-- Индексы таблицы "deliveries"
--
ALTER TABLE "deliveries"
  ADD PRIMARY KEY ("id");

--
-- Индексы таблицы "products"
--
ALTER TABLE "products"
  ADD PRIMARY KEY ("id"),
  ADD KEY "categoryId" ("categoryId");

--
-- Индексы таблицы "settings"
--
ALTER TABLE "settings"
  ADD PRIMARY KEY ("id");

--
-- Индексы таблицы "stores"
--
ALTER TABLE "stores"
  ADD PRIMARY KEY ("id");

--
-- SERIAL для сохранённых таблиц
--

--
-- SERIAL для таблицы "categories"
--
ALTER TABLE "categories"
  MODIFY "id" int(11) NOT NULL SERIAL, SERIAL=6;

--
-- SERIAL для таблицы "deliveries"
--
ALTER TABLE "deliveries"
  MODIFY "id" int(11) NOT NULL SERIAL, SERIAL=11;

--
-- SERIAL для таблицы "products"
--
ALTER TABLE "products"
  MODIFY "id" int(11) NOT NULL SERIAL, SERIAL=5542;

--
-- SERIAL для таблицы "settings"
--
ALTER TABLE "settings"
  MODIFY "id" int(11) NOT NULL SERIAL, SERIAL=6;

--
-- SERIAL для таблицы "stores"
--
ALTER TABLE "stores"
  MODIFY "id" int(11) NOT NULL SERIAL, SERIAL=6;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы "products"
--
ALTER TABLE "products"
  ADD CONSTRAINT "products_ibfk_1" FOREIGN KEY ("categoryId") REFERENCES "categories" ("id");
END;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
