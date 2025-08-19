function switchTab(tabName) {
  // Remove active class from all sidebar items
  document.querySelectorAll('.sidebar-nav-item').forEach(item => {
    item.classList.remove('active');
  });

  // Add active class to clicked item
  document.getElementById('tab-' + tabName).classList.add('active');

  // Update the sidebar menu input value
  const sidebarMenuInput = document.getElementById('sidebarMenu');
  if (sidebarMenuInput) {
    sidebarMenuInput.value = tabName;
    // Trigger Shiny input change event
    if (window.Shiny) {
      Shiny.setInputValue('sidebarMenu', tabName);
    }
  }

  // Switch the actual tab
  const tabElement = document.querySelector('a[data-value=\"' + tabName + '\"]');
  if (tabElement) {
    bootstrap.Tab.getOrCreateInstance(tabElement).show();
  }
}

$(document).ready(function () {
  // Initialize active state on page load
  document.addEventListener('DOMContentLoaded', function() {
    const selectedTab = document.querySelector('.nav.nav-hidden .nav-link.active');
    if (selectedTab) {
      const tabValue = selectedTab.getAttribute('data-value');
      const sidebarItem = document.getElementById('tab-' + tabValue);
      if (sidebarItem) {
        sidebarItem.classList.add('active');
      }
      // Initialize the sidebar menu input value
      const sidebarMenuInput = document.getElementById('sidebarMenu');
      if (sidebarMenuInput && window.Shiny) {
        Shiny.setInputValue('sidebarMenu', tabValue);
      }
    }
  });
})
