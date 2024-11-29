drop table if exists menu_page;
drop table if exists sections;
drop table if exists menus;
drop table if exists pages;
DROP TABLE IF EXISTS `employees`;
DROP TABLE IF EXISTS `messages`;
DROP TABLE IF EXISTS `products`;
DROP TABLE IF EXISTS `reviews`;
DROP TABLE IF EXISTS `product_categories`;



create table pages
(
    id         int unsigned auto_increment
        primary key,
    template   varchar(255)                        not null,
    slug       varchar(255)                        not null
        unique,
    updated_at timestamp default current_timestamp not null,
    created_at timestamp default current_timestamp not null
);



create table menus
(
    id         int unsigned auto_increment
        primary key,
    location   varchar(255)                        not null,
    created_at timestamp default CURRENT_TIMESTAMP not null,
    updated_at timestamp default CURRENT_TIMESTAMP not null,
    title varchar(255) null
);


create table sections
(
    id         int unsigned auto_increment
        primary key,
    page_id    int unsigned                        not null,
    template   varchar(255)                        null,
    content    json                                not null,
    `order`    int unsigned                        not null,
    created_at timestamp default current_timestamp not null,
    updated_at timestamp default current_timestamp not null,
    constraint sections_page_id_pages_id_fk
        foreign key (page_id) references pages (id)
            on delete cascade
);

create table menu_page
(
    id         int auto_increment
        primary key,
    page_id    int unsigned                        not null,
    menu_id    int unsigned                        not null,
    section_id int unsigned                         null,
    label      varchar(255)                        not null,
    title      varchar(255)                        null,
    target     tinyint                             null,
    created_at timestamp default CURRENT_TIMESTAMP not null,
    updated_at timestamp default CURRENT_TIMESTAMP not null,
    constraint menu_page_menu_id_menus_id_fk
        foreign key (menu_id) references menus (id)
            on delete cascade,
    constraint menu_page_page_id_pages_id
        foreign key (page_id) references pages (id)
            on delete cascade,
    constraint menu_page_section_id_sections_id
        foreign key (section_id) references sections (id)
            on delete cascade,
    `order` int unsigned not null
);


CREATE TABLE `employees` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `job` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `img` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
);

CREATE TABLE `product_categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int unsigned DEFAULT NULL,
  `order` int unsigned NOT NULL,
  `pre` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `product_categories_parent_id_product_categories_id` (`parent_id`),
  CONSTRAINT `product_categories_parent_id_product_categories_id` FOREIGN KEY (`parent_id`) REFERENCES `product_categories` (`id`) ON DELETE SET NULL
);

CREATE TABLE `products` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product_category_id` int unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `tag` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `price` int unsigned NOT NULL,
  `discount` int unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_product_category_id_product_categories_id` (`product_category_id`),
  CONSTRAINT `products_product_category_id_product_categories_id` FOREIGN KEY (`product_category_id`) REFERENCES `product_categories` (`id`) ON DELETE RESTRICT
);

CREATE TABLE `reviews` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `customer` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `cover_img` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `avatar_img` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_general_ci NOT NULL,
  `rating` int NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `messages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `content` text COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

delete from employees;

insert into employees (name, job, description, img, created_at, updated_at)
values ('Amandine', 'serveuse', 'Elle est aimable et travail très bien', 'images/team/portrait-elegant-old-man-wearing-suit.jpg', sysdate(), sysdate()),
       ('Edyta', 'DJ', 'Tous les vendredis soir elle vient mettre de l‘ambiance dans le café', 'images/team/cute-korean-barista-girl-pouring-coffee-prepare-filter-batch-brew-pour-working-cafe.jpg', sysdate(), sysdate()),
       ('Christina', 'chef', 'Nous prepare des accompagnements délicieux avec les cafés', 'images/team/small-business-owner-drinking-coffee.jpg', sysdate(), sysdate()),
       ('Lisa', 'barista', 'Nous prepare des accompagnements délicieux avec les cafés', 'images/team/smiley-business-woman-working-cashier.jpg', sysdate(), sysdate());

insert into product_categories (parent_id, `order`, pre, title, created_at, updated_at)
values (1, 1,'favorite menu', 'latte', sysdate(), sysdate()),
       (2, 2,'Delicious menu', 'pancakes', sysdate(), sysdate()),
       (3, 3,'Delicious menu', 'toasted waffle', sysdate(), sysdate());

insert into products (product_category_id, name, description, tag, price, discount, created_at, updated_at, deleted_at)
values (1, 'latte', 'du café avec du lait', 'none', 12, 7,sysdate(), sysdate(), sysdate()),
       (2, 'pancakes', 'mini crepes', 'populaire', 12, 1,sysdate(), sysdate(), sysdate()),
       (3, 'toasted waffle', 'Brewed coffee and steamed milk', 'normal', 16, 12,sysdate(), sysdate(), sysdate());

delete from reviews;

insert into reviews (customer, cover_img, avatar_img, content, rating, verified, created_at, updated_at, deleted_at)
values ('Amelie', 'images/reviews/mid-section-waitress-wiping-espresso-machine-with-napkin-cafa-c.jpg', 'images/reviews/young-woman-with-round-glasses-yellow-sweater.jpg', 'Les prix ne sont pas trop cher et les produits sont bons', 4, 4, sysdate(), sysdate(), sysdate()),
       ('Eline', 'images/reviews/mid-section-waitress-wiping-espresso-machine-with-napkin-cafa-c.jpg', 'images/reviews/young-beautiful-woman-pink-warm-sweater-natural-look-smiling-portrait-isolated-long-hair.jpg', 'très bon, je ne suis pas déçu', 4, 4, sysdate(), sysdate(), sysdate()),
       ('Tom', 'images/reviews/mid-section-waitress-wiping-espresso-machine-with-napkin-cafa-c.jpg', 'images/reviews/senior-man-white-sweater-eyeglasses.jpg', 'Les prix ne sont pas trop cher et les produits sont assez bons', 4, 4, sysdate(), sysdate(), sysdate());


SELECT `name`, `job`, `description`, `img`
FROM `employees`
ORDER BY `name` ASC
LIMIT 4;

SELECT `customer`,`cover_img`,`avatar_img`, `content`, `rating`, `verified`
FROM `reviews`
ORDER BY `customer` ASC
LIMIT 3;