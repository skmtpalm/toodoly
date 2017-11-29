import jQuery from 'jquery';
import datepicker from '@fengyuanchen/datepicker';

(($) => {
  $('.task-text-toggle-nav').on('click', function() {
    const targetTaskId = $(this).data('target-task-id')

    $(`#task-text-${targetTaskId}`).toggleClass('is-active');
  })

  $('[data-toggle="datepicker"]').datepicker()
})(jQuery)
