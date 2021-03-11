defmodule AutoWateringWeb.ModalComponent do
  use AutoWateringWeb, :live_component

  @impl true
  def render(assigns) do
    ~L"""

<!-- This example requires Tailwind CSS v2.0+ -->
<div class="fixed z-10 inset-0 overflow-y-auto">
  <div class="flex items-end justify-center min-h-screen pt-4 px-4 pb-20 text-center sm:block sm:p-0">

  <div class="fixed inset-0 transition-opacity" aria-hidden="true">
      <div class="absolute inset-0 bg-gray-500 opacity-75"></div>
    </div>


  <span class="hidden sm:inline-block sm:align-middle sm:h-screen" aria-hidden="true">&#8203;</span>

    <div id="<%= @id %>"
      class="inline-block align-bottom bg-white rounded-lg text-left overflow-hidden shadow-xl transform transition-all sm:my-8 sm:align-middle sm:max-w-lg sm:w-full"
      role="dialog"
      aria-modal="true"
      aria-labelledby="modal-headline"
      phx-capture-click="close"
      phx-window-keydown="close"
      phx-key="escape"
      phx-target="#<%= @id %>"
      phx-page-loading>

      <div class="bg-white px-4 pt-5 pb-4 sm:p-6 sm:pb-4">
          <div class="absolute top-2 right-3 text-xl text-gray-500">
          <%= live_patch raw("&times;"), to: @return_to, class: "phx-modal-close" %>
          </div>




 <div class="sm:flex sm:items-start">


 <div class="mx-auto flex-shrink-0 flex items-center justify-center h-12 w-12 rounded-full bg-blue-100 sm:mx-0 sm:h-10 sm:w-10">
            <!-- Heroicon name: outline/exclamation -->
            <svg stroke="currentColor" class="h-6 w-6 text-blue-600" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" x="0px" y="0px" viewBox="0 0 1000 1000" enable-background="new 0 0 1000 1000" xml:space="preserve">
            <metadata> Svg Vector Icons : http://www.onlinewebfonts.com/icon </metadata>
            <g><g id="XMLID_144_"><path id="XMLID_151_" d="M687.7,929.7H75.3V70.3h612.4v213l65.3-65.3V37.7c0-18-14.6-32.6-32.6-32.6H42.6C24.6,5,10,19.6,10,37.7v924.7c0,18,14.6,32.6,32.6,32.6h677.7c18,0,32.6-14.6,32.6-32.6V603.1l-65.3,65.3V929.7z"/><path id="XMLID_150_" d="M591.4,148.6H171.5c-13.8,0-24.9,11.2-24.9,24.9c0,13.8,11.2,24.9,24.9,24.9h419.9c13.8,0,24.9-11.2,24.9-24.9C616.4,159.8,605.2,148.6,591.4,148.6z"/><path id="XMLID_149_" d="M616.4,306.6c0-13.8-11.2-24.9-24.9-24.9H171.5c-13.8,0-24.9,11.2-24.9,24.9c0,13.8,11.2,24.9,24.9,24.9h419.9C605.2,331.5,616.4,320.4,616.4,306.6z"/><path id="XMLID_148_" d="M556.3,414.7H171.5c-13.8,0-24.9,11.2-24.9,24.9c0,13.8,11.2,24.9,24.9,24.9h334.9L556.3,414.7z"/><path id="XMLID_147_" d="M416.8,580c3.4-11.3,8.2-22.1,14.1-32.3H171.5c-13.8,0-24.9,11.2-24.9,24.9c0,13.8,11.2,24.9,24.9,24.9h240L416.8,580z"/><path id="XMLID_146_" d="M171.5,680.8c-13.8,0-24.9,11.2-24.9,24.9c0,13.8,11.2,24.9,24.9,24.9h219.1c-6.5-15.7-8.1-33-3.6-49.9H171.5z"/><path id="XMLID_145_" d="M969.6,194c-13.1-13.1-30.8-20.4-49.3-20.4c-18.5,0-36.2,7.3-49.2,20.4L502.1,563c-10.1,10.1-17.5,22.5-21.5,36.1l-29.4,98.6c-1.3,4.2-0.1,8.7,3,11.8c2.3,2.3,5.3,3.5,8.4,3.5c1.1,0,2.3-0.2,3.4-0.5l98.6-29.4c13.6-4.1,26-11.5,36.1-21.5l369.1-369c13.1-13.1,20.4-30.8,20.4-49.2C990,224.7,982.7,207,969.6,194z"/></g><g/><g/><g/><g/><g/><g/><g/><g/><g/><g/><g/><g/><g/><g/><g/></g>
            </svg>



          </div>


          <div class="mt-3 text-center sm:mt-0 sm:ml-4 sm:text-left">
            <h3 class="text-lg leading-6 font-medium text-gray-900" id="modal-headline">
            <%= @opts[:title] %>
            </h3>
            <div class="mt-2">
              <p class="text-sm text-gray-500">
              <%= live_component @socket, @component, @opts %>
              </p>
            </div>
          </div>
        </div>
      </div>



      </div>
    </div>

    </div>
    </div>
    
    """
  end

  @impl true
  def handle_event("close", _, socket) do
    {:noreply, push_patch(socket, to: socket.assigns.return_to)}
  end
end
