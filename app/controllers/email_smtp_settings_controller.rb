class EmailSmtpSettingsController < ApplicationController
  # GET /email_smtp_settings
  # GET /email_smtp_settings.json
  def index
    @email_smtp_settings = EmailSmtpSetting.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @email_smtp_settings }
    end
  end

  # GET /email_smtp_settings/1
  # GET /email_smtp_settings/1.json
  def show
    @email_smtp_setting = EmailSmtpSetting.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @email_smtp_setting }
    end
  end

  # GET /email_smtp_settings/new
  # GET /email_smtp_settings/new.json
  def new
    @email_smtp_setting = EmailSmtpSetting.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @email_smtp_setting }
    end
  end

  # GET /email_smtp_settings/1/edit
  def edit
    @email_smtp_setting = EmailSmtpSetting.find(params[:id])
  end

  # POST /email_smtp_settings
  # POST /email_smtp_settings.json
  def create
    @email_smtp_setting = EmailSmtpSetting.new(params[:email_smtp_setting])

    respond_to do |format|
      if @email_smtp_setting.save
        format.html { redirect_to @email_smtp_setting, notice: 'Email smtp setting was successfully created.' }
        format.json { render json: @email_smtp_setting, status: :created, location: @email_smtp_setting }
      else
        format.html { render action: "new" }
        format.json { render json: @email_smtp_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /email_smtp_settings/1
  # PUT /email_smtp_settings/1.json
  def update
    @email_smtp_setting = EmailSmtpSetting.find(params[:id])

    respond_to do |format|
      if @email_smtp_setting.update_attributes(params[:email_smtp_setting])
        format.html { redirect_to @email_smtp_setting, notice: 'Email smtp setting was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @email_smtp_setting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /email_smtp_settings/1
  # DELETE /email_smtp_settings/1.json
  def destroy
    @email_smtp_setting = EmailSmtpSetting.find(params[:id])
    @email_smtp_setting.destroy

    respond_to do |format|
      format.html { redirect_to email_smtp_settings_url }
      format.json { head :no_content }
    end
  end

  def activate_smtp
    params[:setting_id]
    @email_smtp_setting = EmailSmtpSetting.find params[:setting_id] if params[:setting_id].present?

    if @email_smtp_setting.present?
      @prev_smtp = EmailSmtpSetting.find_by_status(true)
      if @prev_smtp.present?
        @prev_smtp.update_attributes(:status => false)
      end
      @email_smtp_setting.update_attributes(:status => true)
    end

    render :nothing => true
  end
end
