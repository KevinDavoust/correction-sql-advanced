USE kaamelott;

-- Dans un fichier .sql, les tirets en début de ligne permettent de commenter du code 
-- afin qu'il ne soit pas exécuté
-- ⬇ écrire les requêtes de l'atelier ici ⬇

-- Le prénom, nom et âge des personnages --
select firstname, lastname, age from Person;

-- Le prénom, nom des personnages ainsi que leur royaume, uniquement
-- pour ceux étant reliés à un royaume
select Person.firstname, Person.lastname, Kingdom.name as kingdom from Person
inner join Kingdom on Person.kingdom_id = Kingdom.id

-- La même chose en incluant tous les personnages
select Person.firstname, Person.lastname, Kingdom.name as kingdom from Person
left join Kingdom on Person.kingdom_id = Kingdom.id;

select firstname, lastname, name from Kingdom
right join Person on Kingdom.id = Person.kingdom_id;

-- La moyenne de l’âge des personnages
select round(avg(age)) from Person;

-- La moyenne de tous les personnages n’ayant pas le rôle de magicien
select round(avg(age)) from Person
join Role on Person.role_id = Role.id
where role <> "magicien";

-- Le nombre de personnage par royaume (inclure les royaumes n’ayant pas de personnage)
select count(p.id) as nb_persons, k.name as kingdom
from Person as p
right join Kingdom k on p.kingdom_id = k.id
group by kingdom;


-- La moyenne de l’âge par rôle
select r.role, round(avg(p.age)) from Person as p
inner join Role r on p.role_id = r.id
group by r.role;

-- La liste de tous les personnages avec leur rôle et royaume éventuels
select p.firstname, p.lastname, p.age, Kingdom.name, Role.role from Person p
left join Role on p.role_id = Role.id
left join Kingdom on p.kingdom_id = Kingdom.id;

-- La liste des royaumes ayant au moins 2 sujets
select Kingdom.name, count(Person.id) from Kingdom
inner join Person on Kingdom.id = Person.kingdom_id
group by Kingdom.name
having count(Person.id) >= 2;

select firstname, lastname, name from Person
right join Kingdom on Person.kingdom_id = Kingdom.id;