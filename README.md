# widget_report_grist

Custom widget для [Grist](https://www.getgrist.com/) — генерация отчётов на основе данных таблиц.

## Подключение в Grist

1. Откройте документ Grist
2. Добавьте виджет → Custom
3. В поле URL вставьте ссылку на размещённый `index.html` (например, GitHub Pages этого репо)
4. Дайте виджету необходимые права доступа к таблице

## Структура

- `index.html` — точка входа виджета
- `grist-plugin-api.js` подключается из CDN Grist

## Локальная разработка

Любой статический сервер подойдёт:

```bash
python3 -m http.server 8000
```

И в Grist указать `http://localhost:8000`.

## Лицензия

MIT
