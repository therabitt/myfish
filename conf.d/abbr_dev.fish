status is-interactive; or return

# ── Docker ──────────────────────────────────────────────────────
abbr dk     'docker'
abbr dkps   'docker ps'
abbr dkpsa  'docker ps -a'
abbr dkst   'docker stop'
abbr dkrm   'docker rm'
abbr dkimg  'docker images'
abbr dkex   'docker exec -it'
abbr dkl    'docker logs -f'
abbr dkpl   'docker pull'
abbr dkb    'docker build -t'
abbr dkr    'docker run --rm -it'

# ── Docker Compose ──────────────────────────────────────────────
abbr dc     'docker compose'
abbr dcu    'docker compose up -d'
abbr dcd    'docker compose down'
abbr dcl    'docker compose logs -f'
abbr dcr    'docker compose restart'
abbr dcb    'docker compose build'
abbr dcps   'docker compose ps'
abbr dcex   'docker compose exec'

# ── npm ─────────────────────────────────────────────────────────
abbr ni     'npm install'
abbr nid    'npm install -D'
abbr nr     'npm run'
abbr nd     'npm run dev'
abbr nb     'npm run build'
abbr ns     'npm start'
abbr nt     'npm test'
abbr nig    'npm install -g'
abbr nu     'npm update'
abbr nls    'npm list --depth=0'

# ── pnpm ────────────────────────────────────────────────────────
abbr pi     'pnpm install'
abbr pid    'pnpm install -D'
abbr pd     'pnpm dev'
abbr pb     'pnpm build'
abbr pr     'pnpm run'
abbr pa     'pnpm add'
abbr pad    'pnpm add -D'
abbr px     'pnpm dlx'

# ── Cargo (Rust) ────────────────────────────────────────────────
abbr cr     'cargo run'
abbr cb     'cargo build'
abbr cbr    'cargo build --release'
abbr ct     'cargo test'
abbr cw     'cargo watch -x run'
abbr ca     'cargo add'
abbr cc     'cargo check'
abbr cf     'cargo fmt'
abbr ccl    'cargo clippy'

# ── Go ──────────────────────────────────────────────────────────
abbr gor    'go run .'
abbr gob    'go build'
abbr got    'go test ./...'
abbr gom    'go mod tidy'
abbr gog    'go get'

# ── Systemctl ───────────────────────────────────────────────────
abbr sc     'sudo systemctl'
abbr sce    'sudo systemctl enable'
abbr scd    'sudo systemctl disable'
abbr scr    'sudo systemctl restart'
abbr scs    'sudo systemctl status'
abbr scst   'sudo systemctl start'
abbr scsp   'sudo systemctl stop'

# ── Process ─────────────────────────────────────────────────────
abbr psg    'ps aux | rg'
