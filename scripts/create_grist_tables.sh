#!/usr/bin/env bash
# Создание служебных таблиц для widget_report_grist
# Запуск: bash create_grist_tables.sh

set -e

HOST="https://lmp-test-dec.getgrist.com"
DOC_ID="5GtDphApyrjG"
API_KEY="0147018d475a6b3c9327441a74398debe41a76d8"   # ⚠ ОТЗОВИ после использования

echo "→ Создаю таблицу Templates..."
curl -sS -X POST "$HOST/api/docs/$DOC_ID/tables" \
  -H "Authorization: Bearer $API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "tables": [{
      "id": "Templates",
      "columns": [
        {"id": "ClientId",   "fields": {"label": "Client ID",        "type": "Text"}},
        {"id": "Name",       "fields": {"label": "Название",         "type": "Text"}},
        {"id": "GroupCount", "fields": {"label": "Кол-во групп",     "type": "Int"}},
        {"id": "Fields",     "fields": {"label": "Поля (JSON)",      "type": "Text"}},
        {"id": "PdfBase64",  "fields": {"label": "PDF (base64)",     "type": "Text"}},
        {"id": "UpdatedAt",  "fields": {"label": "Обновлено",        "type": "DateTime:UTC"}},
        {"id": "UpdatedBy",  "fields": {"label": "Автор",            "type": "Text"}}
      ]
    }]
  }' | python3 -m json.tool

echo ""
echo "→ Создаю таблицу LastFilters..."
curl -sS -X POST "$HOST/api/docs/$DOC_ID/tables" \
  -H "Authorization: Bearer $API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "tables": [{
      "id": "LastFilters",
      "columns": [
        {"id": "Label",        "fields": {"label": "Описание фильтра", "type": "Text"}},
        {"id": "Author",       "fields": {"label": "Автор",            "type": "Text"}},
        {"id": "BatchValue",   "fields": {"label": "Партия",           "type": "Text"}},
        {"id": "OrderValue",   "fields": {"label": "Заказ",            "type": "Text"}},
        {"id": "SearchValue",  "fields": {"label": "Поиск",            "type": "Text"}},
        {"id": "TemplateName", "fields": {"label": "Шаблон (если печать)", "type": "Text"}},
        {"id": "AppliedAt",    "fields": {"label": "Применён",         "type": "DateTime:UTC"}}
      ]
    }]
  }' | python3 -m json.tool

echo ""
echo "✓ Готово. Проверь в Grist: $HOST/$DOC_ID"
