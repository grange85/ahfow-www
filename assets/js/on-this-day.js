// On this day - update 2026-09-02
const d = new Date();
const mm = String(d.getMonth() + 1).padStart(2, '0');
const dd = String(d.getDate()).padStart(2, '0');
document.getElementById('on-this-day-link').href = `/database/on-this-day/${mm}-${dd}/`;
