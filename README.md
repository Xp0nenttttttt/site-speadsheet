# Geometry Dash Refonte

Base statique prête pour GitHub Pages, avec :
- une landing à 3 boutons
- une page Info
- une page Statistiques
- une page Progression
- lecture des données depuis Supabase

## Mise en route

1. Crée un projet Supabase.
2. Exécute `supabase-schema.sql`.
3. Renseigne `SUPABASE_URL` et `SUPABASE_ANON_KEY` dans `index.html`.
4. Ajoute tes données dans `profiles` et `levels`.
5. Déploie le dossier sur GitHub Pages.

## Colonnes importantes

Dans `profiles` :
- `display_name`
- `image_url`
- `hours_played`
- `country_rank`
- `global_rank`
- `aredl_rank`
- `pointercrate_rank`
- `extremes_finished`
- `hardest_title`
- `hardest_rank`
- `custom_categories`

Dans `levels` :
- `name`
- `status`
- `difficulty`
- `top_rank`
- `completion_date`
- `attempts`
- `enjoyment`
- `worst_death`
- `progress`
- `image_url`
- `categories`

## Statuts utilisés

- `active`
- `done`
- `paused`
- `giveup`

## GitHub Pages

Le site est pensé pour fonctionner en simple fichier HTML statique. Tu peux le mettre dans la racine du dépôt ou dans `/docs` selon ta config GitHub Pages.
