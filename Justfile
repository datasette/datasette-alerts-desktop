
dev *options:
  uvx sqlite-utils create-table data.db --ignore demo id integer name text --pk id

  DATASETTE_SECRET=abc123 \
  uv run \
    --with-editable . \
    --with-editable ../datasette-alerts \
    --with datasette-write-ui \
    --isolated --refresh --no-cache \
    datasette \
      -s permissions.datasette-alerts-access.id root \
      --root \
      data.db {{options}}
