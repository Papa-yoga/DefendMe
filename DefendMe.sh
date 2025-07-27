#!/data/data/com.termux/files/usr/bin/bash
echo "[+] Starting DefendMe scan..."

# القسم 1: فحص DNS
if ping -c 1 1.1.1.1 >/dev/null 2>&1; then
  dns_status="✅ DNS reachable"
else
  dns_status="❌ DNS unreachable"
fi

# القسم 2: فحص التطبيق المشبوه على المنفذ 10490
app=$(lsof -i :10490 | grep ESTABLISHED | awk '{print $1}' | head -n1)

if [ -n "$app" ]; then
  pid=$(pidof $app)
  pkg=$(cmd package list packages -U | grep "$pid" | cut -d':' -f2)
  threat="⚠️ Suspicious app detected: $app ($pkg)"

  # تخزين في اللوق
  echo "[$(date)] $app → $pkg [DETECTED]" >> ~/DefendMe_Log.txt

  # أوامر المعالجة
  am force-stop $pkg
  pm uninstall --user 0 $pkg > /dev/null 2>&1

else
  threat="✅ No suspicious app detected on port 10490"
fi

# إشعار موحد بالنتيجة
termux-notification \
  --title "🛡️ DefendMe Scan Result" \
  --content "$dns_status • $threat" \
  --id 19990

# طباعة النتائج
echo "$dns_status"
echo "$threat"
echo "[/] DefendMe finished."