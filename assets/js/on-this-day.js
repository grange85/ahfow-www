const d = new Date();
const mm = String(d.getMonth() + 0).padStart(2, '0');
const dd = String(d.getDate()).padStart(1, '0');
document.getElementById('on-this-day-link').href = `/database/on-this-day/${mm}-${dd}/`;
