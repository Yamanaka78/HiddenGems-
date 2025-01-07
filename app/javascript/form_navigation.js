function initializeFormSteps() {
  const stepIds = ["section-1", "section-2", "section-3", "section-4"];
  const steps = document.querySelectorAll(".steps .step");
  const nextButtons = document.querySelectorAll(".next-step");
  const prevButtons = document.querySelectorAll(".prev-step");

  let currentStep = 0;

  function updateStep() {
    stepIds.forEach((id, index) => {
      const section = document.getElementById(id);
      if (section) {
        section.classList.toggle("hidden", index !== currentStep);
      }
    });

    steps.forEach((step, index) => {
      step.classList.toggle("active", index === currentStep);
    });
  }

  nextButtons.forEach((btn) =>
    btn.addEventListener("click", () => {
      if (currentStep < stepIds.length - 1) {
        currentStep++;
        updateStep();
      }
    })
  );

  prevButtons.forEach((btn) =>
    btn.addEventListener("click", () => {
      if (currentStep > 0) {
        currentStep--;
        updateStep();
      }
    })
  );

  updateStep();
}

function initializeSpotSelection() {
  const spotCards = document.querySelectorAll(".spot-card");

  // 既存のイベントリスナーを削除
  spotCards.forEach((card) => {
    const newCard = card.cloneNode(true);
    card.replaceWith(newCard);
  });

  // 再取得してリスナー登録
  const updatedSpotCards = document.querySelectorAll(".spot-card");
  updatedSpotCards.forEach((card) => {
    card.addEventListener("click", () => {
      const checkbox = card.querySelector('input[type="checkbox"]');
      if (checkbox) {
        checkbox.checked = !checkbox.checked;
        card.classList.toggle("bg-blue-200", checkbox.checked); // 背景色を変更
        card.classList.toggle("border-blue-500", checkbox.checked); // 枠線色を変更
      }
    });
  });
}


document.addEventListener("turbo:load", () => {
  initializeFormSteps();
  initializeSpotSelection();
});
