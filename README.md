- front側
    - `flutter run -d web-server --web-hostname=0.0.0.0 --web-port=8000`

- server側
    - `docker compose up -d --build`
    - `docker compose exec todo_app bash`
    - `cd server/migrations`
    - `poetry run alembic upgrade head`

