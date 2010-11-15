# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101111184917) do

  create_table "citas", :force => true do |t|
    t.date     "fecha"
    t.integer  "hora"
    t.integer  "cliente_id"
    t.integer  "estados_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "estados", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ordendetalles", :force => true do |t|
    t.integer  "orden_id"
    t.integer  "servicio_id"
    t.text     "descripcion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ordenes", :force => true do |t|
    t.integer  "cita_id"
    t.integer  "estado_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "serviciorepuestos", :force => true do |t|
    t.integer  "orden_detalle_id"
    t.integer  "repuesto_id"
    t.integer  "cantidad"
    t.decimal  "costo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vehiculos", :force => true do |t|
    t.string   "placa"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
