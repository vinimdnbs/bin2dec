const form = document.querySelector('form');

form.addEventListener('submit', bin2dec);

function bin2dec(event) {
  event.preventDefault();

  const data = {
    binaryNumber: document.getElementById('binaryNumber').value
  };

  fetch('/convert', {
    headers: { 'Content-Type': 'application/json' },
    method: 'POST',
    body: JSON.stringify(data)
  })
  .then(res => res.json())
  .then(data => document.getElementById('decimalNumber').innerHTML = data.decimalNumber);
}