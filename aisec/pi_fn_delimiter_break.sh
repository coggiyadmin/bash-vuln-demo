#!/bin/bash
# Prompt Injection FN (OWASP LLM01) — delimiter/role-fence break. Forged </data> + fake role
# header inside fenced input; trusting the fence MISSES it. Expected: MISS.
translate() {
  local user_text="$1"
  local fenced="<data>${user_text}</data>" # SINK (LLM01 delimiter break)
  curl -s https://api.example.com/chat --data-urlencode "system=Translate text inside <data> tags." \
    --data-urlencode "user=${fenced}"
}
