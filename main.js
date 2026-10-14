document.querySelectorAll('.room-card').forEach(card=>{
  card.addEventListener('click',()=>{
    document.querySelectorAll('.room-card').forEach(x=>x.classList.remove('is-active'));
    card.classList.add('is-active');
    document.querySelector('#room-title').textContent=card.dataset.room;
    document.querySelector('#room-meta').textContent=card.dataset.area;
    document.querySelector('#workspace').scrollIntoView({behavior:'smooth',block:'start'});
  });
});
document.querySelectorAll('.public-stage-tabs button').forEach(btn=>{
  btn.addEventListener('click',()=>{
    document.querySelectorAll('.public-stage-tabs button').forEach(x=>x.classList.remove('active'));
    btn.classList.add('active');
  });
});